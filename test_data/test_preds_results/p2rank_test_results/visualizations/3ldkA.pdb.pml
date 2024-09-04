
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
        
        load "data/3ldkA.pdb", protein
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
 
        load "data/3ldkA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [323,313,316,322,2896,2897,301,302,303,480,481,458,460,739,740,741,750,729,738,482,483,742,743,918,921,909,910,725,2693,2386,2411,2412,2377,2383,2937,2938,2952,2953,2955,927,933,2370,2683,2941,2939,2936,2924,2925,2117,2119,2099,2314,2315,936,2685,2118,2126,1292,1293,1294,1301] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [364,368,780,781,782,370,2737,2736,2749,383,384,789,783,2720,2721,2850,2713,2715,1319,1318,1323,2716,2224,2225,2723,1577,1331,1338,1342,1622,1341,1621,2210,2226,2722,2828,2830,1579,1580,1578,1346] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [2445,2448,2607,2610,3278,3279,2039,4221,4494,4495,3395,4496,4497,4233,4498,2041,4228,4235,3400,3277,3284,3285,3290,3292,4263,2645,4508] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [2640,2647,2649,4211,4213,2401,2402,2654,2406,2414,2419,2618,2620,2403,2420,2656,2661,2658,4206,2021,2049,2619,2025] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [4387,4388,4389,3472,4374,4370,4467,3412,4466,4468,3429,3470,3471,3418,3423,3421,3424,3427,3431,4488,4487] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [1269,946,939,951,1682,2084,2085,2087,2089,2352,1961,1962,1686,1687,1672,1677] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [224,229,231,232,268,216,217,218,176,185,187,4846,4848,4878,4876,4883,4845,4834,4835,4836,280] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [376,377,378,390,391,829,830,398,821,1064,1065,1066,1086,1087] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [3978,4071,3960,3884,4674,4675,4677,4679,4676,3946,4678] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [2009,1998,2001,2035,3253,3257,3266,2018,2022,2027,2026] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        