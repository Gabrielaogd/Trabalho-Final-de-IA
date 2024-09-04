
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
        
        load "data/2ez2A.pdb", protein
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
 
        load "data/2ez2A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [405,406,418,419,420,2024,2965,1694,1695,1696,2023,1705,2001,3161,297,299,399,795,797,796,2015,983,984,990,3551,2983,1467,978,1439,1450,1465,981,1684,3550,3539,997,998,807,808,798,800,826,827,828] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [1115,960,1170,1172,1173,967,966,1097,1099,1112,3097,3098,3107,3110,3125,3113,968,970,1014,3089,3090,3092,3094,3095,1472,3128,3126] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [207,208,209,2912,2882,2885,2886,2922,2879,2913,2880,2878,3419,3420,3400,3401,271,3604,3603] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [978,1439,1450,1459,1461,1465,1004,1684,949,957,974,1424,943,1005,1046,1426] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [988,1010,1011,1017,1018,1021,1024,1026,3512,3523,3511,3489,3496,3503,3506,969,3009,3015,1012,971,3018,3021,3525,3044,1056,3024,986,3518] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [58,61,62,63,64,3211,53,2425,71,444,3208,87,3209,3212,2451,3213,448,2402,454,457,2401,2403,465,91,2399] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1005,1044,1046,1426,1409,1411,858,1988,852] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        