
        from pymol import cmd,stored
        
        set depth_cue, 1
        set fog_start, 0.4
        
        set_color b_col, [36,36,85]
        set_color t_col, [10,10,10]
        set bg_rgb_bottom, b_col
        set bg_rgb_top, t_col      
        set bg_gradient
        
        set  spec_power  =  200
        set  spec_refl   =  0
        
        load "data/2dkcA.pdb", protein
        create ligands, protein and organic
        select xlig, protein and organic
        delete xlig
        
        hide everything, all
        
        color white, elem c
        color bluewhite, protein
        #show_as cartoon, protein
        show surface, protein
        #set transparency, 0.15
        
        show sticks, ligands
        set stick_color, magenta
        
        
        
        
        # SAS points
 
        load "data/2dkcA.pdb_points.pdb.gz", points
        hide nonbonded, points
        show nb_spheres, points
        set sphere_scale, 0.2, points
        cmd.spectrum("b", "green_red", selection="points", minimum=0, maximum=0.7)
        
        
        stored.list=[]
        cmd.iterate("(resn STP)","stored.list.append(resi)")    # read info about residues STP
        lastSTP=stored.list[-1] # get the index of the last residue
        hide lines, resn STP
        
        cmd.select("rest", "resn STP and resi 0")
        
        for my_index in range(1,int(lastSTP)+1): cmd.select("pocket"+str(my_index), "resn STP and resi "+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.show("spheres","pocket"+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_scale","0.4","pocket"+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_transparency","0.1","pocket"+str(my_index))
        
        
        
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [2953,2795,2797,2800,2808,2811,2979,2981,2967,2212,2964,511,514,1980,2805,2978,2980,2982,3309,2202,2804,2806,2931,2933,2838,2839,2840,2841,3302,3307,3308,3297,3295,3311,2843,2842,3288,2624,2625,2626,2627,3943,4003,4004,4005,2014,3584,3582,3596,3599,203,579,206,503,504,229,230,197,198,577,1276,1277,633,585,624,627,629,632,614,615,617,581,1243,200,3967,201,199,3965,3966,228,513,3976,2955,2959,2622,2623,2005,2007,2008] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [3724,3725,3727,3908,3906,3907,2774,2760,2769,2773,2756,2634,2606,2666,2664,2665,2610,2615,2702] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [3281,3282,3284,3319,1428,1464,1466,1284,1423,1454,1456,1370,1371,1458,1457,3278,3283,3272,3255] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        