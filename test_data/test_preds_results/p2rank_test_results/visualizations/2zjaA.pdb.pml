
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
        
        load "data/2zjaA.pdb", protein
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
 
        load "data/2zjaA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4872,4875,4878,4879,4880,4848,4852,4134,4127,4137,4132,3212,3219,3880,3874,3875,3878,4873,4874,584,778,786,787,800,802,804,3861,947,3857,3863,3864,1226,3244,3245,4817,1209,949,1206,1207,1196,581,582,583,935,4840,4841,4866,4867,793,4845,4843,4815,4847] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [360,362,361,2842,2843,2584,2586,2604,596,597,2587,567,566,1134,1135,1137,1136,1155,565,628,1127,1128,391,392,359,385,386,617,620,629,657,658,2583,2581,2582,2873,2872,2839,2840,2844,2815,2558,1162] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [1541,1542,2861,2862,1571,1370,1371,350,353,354,1515,1513,1516,2832,2831,2833,2834,3092,2828,2830,2829,1590,1591,1589] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [4114,4116,4112,4523,4524,3927,3928,3929,4394,4395,4392,3899,4389,4407,4437,4444,4529,4531,4491,4494] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [4865,4866,4867,793,4904,5082,790,791,792,4903,4905,4907,5119,5083,4874,786,787,794,788,4906,806,810,807,808,809,4872] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [2382,2385,2422,2412,2413,2421,2445,2446,2452,610,619,588,589,595,597,2606,2588,2589,2591,616,2572,2576] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [4807,4809,4810,2381,2382,2412,2413,4783,4816,4781,575,4817,2575,2576,2574,572,580,585,586,589] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [1856,2637,2960,1796,2645,2646,2959,1742,1744,1675,1677,1674,1720,1721,1722] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [4652,5073,5041,5039,4044,4045,4027,5066,5099,5101,5162] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [3310,1023,996,1058,1311,3312,1000,1276,1279,1059] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        