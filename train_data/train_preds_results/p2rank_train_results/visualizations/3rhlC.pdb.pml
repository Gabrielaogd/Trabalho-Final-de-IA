
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
        
        load "data/3rhlC.pdb", protein
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
 
        load "data/3rhlC.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [10151,9164,10963,10965,10950,10967,10949,10962,10964,10966,9728,9730,9729,9731,9757,9734,9735,9758,9577,9580,9206,9207,9724,9725,11469,11470,9163,9137,9140,9141,9722,9727,9716,9126,9130,9131,9789,9572,9573,9574,9575,9576,9608,10564,10532,10961,9232,11549,9244,9234,9634,9897,11172,11173,9900,9901,9907,9779,9787,11427,9233,11426,10159,10146,8768,11407,11408,9154,9149,9151,10508,9357,9362,9363,10509,9356,9344,9347,9348,9335,9352,10530,10521,10522,10523,8740,9199,8739,9173,10107,10108,8766] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [10040,10104,10089,10098,10099,10090,10109,10106,10067,10340,10374,10336,10091,8708,8709,10457,10461,10459,10372,10458,10038,10068,10069,10072,10073,10062,10063,10064] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [8143,8144,8130,8131,8152,8654,7890,7877,7878,10403,10417] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [7941,7937,8604,9414,8576,8578,9471,7850,7852,7935,9439,7939] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        