
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
        
        load "data/1v0yA.pdb", protein
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
 
        load "data/1v0yA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3333,3331,2429,2430,2763,2765,2764,2736,2737,2738,1172,1175,1193,3367,3368,3369,1150,1151,1154,2459,3338,2494,1145,2460,2463,1195,3314,3343,3348,3182,1311,1329,1330,3180,1356,2747,2748,2749,638,639,643] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1279,519,520,1277,1223,521,727,617,490,1317,668,1206,1299,1300,1302,1451,1276,622,1204,1213,1214,1219,629,630] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [2059,2316,2314,2323,2324,2296,2315,2347,2056,112,123,2035,2037,2050,2053,83,88,2297,2298,85,113,2542,2545,2546,2319,2549,2547,2544] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [2378,2380,2381,3243,2376,2379,2664,2665,3015,2395,2396,2398,3564,3016,3661,3535,3500,3501,3502,3503,3539,3540,3541,3566] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [513,539,543,544,562,565,561,1239,1261,260,1267,1477,1479,1266,1257,259,1873] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [2745,2747,3163,2722,1344,1350,1422,1402,1408,1355,3143,1406] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [1953,1952,2162,2259,1978,2226,2227,1981,2205,2206,2178,2230,2232,1146,2160] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [327,3516,3517,299,303,306,478,288,3512,365,366,450,452,454,477,448,449,379,345,346,348,373] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [347,1428,382,384,3192,1427,351,352,356,362,363] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        