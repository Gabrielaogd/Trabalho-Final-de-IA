
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
        
        load "data/1p1jA.pdb", protein
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
 
        load "data/1p1jA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2711,2712,2713,2714,2707,2708,1868,1874,1876,2706,1875,1877,1878,1879,1882,1885,1433,1434,2699,2703,2705,2259,1871,2265,1863,1864,1867,1901,2129,2130,2817,2818,2819,3074,1891,2745,2444,3357,3358,3360,2698,528,3359,2450,2452,2446,3356,536,538,3387,535,537,2449,2468,3153,3778,3779,2851,2473,2685,520,523,527,531,530,1869,504,1170,1171,1172,1058,1368,1074,1075,1076,1077,1082,1083,1084,1070,1485,1486,1487,501,1372,1384] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [739,740,741,728,734,662,663,713,714,715,717,721,661,3392,3374,577,580,555,1205,1194,1206,1211,1213,679,737,3394,3425,731,601,1242,757,3399,3370,3401,3368,3371,3373,3352] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [3666,3668,3718,3720,3721,3722,191,361,363,193,195,359,362,382,3537,3710,3712,176,177,189,190,192,194,3954,3931,3952,3958,3959,3962,3965,3995,174,381,3675,3671,3539] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [3788,3793,3798,3782,2436,3783,2269,2434,2841,3784,1923,1922,2283,2284,2285,2286,2299,2300,2297,2835,2863] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1038,1041,1042,569,1331,1023,587,586,616,617,567,595,594,596,1036] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [3746,3747,3916,2494,2496,3883,779,780,775,776,2497,768,771,3409,3917,772,809,2495,2498,766,767,3378,3382,2527,2499,2502] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [3502,3657,3659,3501,2226,2227,3504,2213,2396,2394,2411,2412,3656,2407,2408,2402,2409,2410] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        