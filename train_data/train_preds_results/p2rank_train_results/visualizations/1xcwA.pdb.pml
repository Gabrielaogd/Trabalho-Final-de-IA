
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
        
        load "data/1xcwA.pdb", protein
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
 
        load "data/1xcwA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1295,1296,1297,1309,2395,2436,2437,2438,478,484,485,487,488,489,1289,1199,1200,1201,2396,2432,2440,2441,2442,2447,1566,1567,1572,1290,519,520,521,522,518,2388,1597,1869,1583,1585,1587,1859,1860,1861,1873,1874,1876,483,490,492,531,534,491,2852,2853,2854] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2867,2756,2860,2868,440,441,444,2872,2894,2881,2887,2869,2893,2890,2728] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [2417,2817,2821,2785,2787,2763,2765,2786,2457,2459,2460,2522,2808,2408,2415,2507,2400,2489,2488,2416,2425,2426,2471,2470,2455] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [3082,3104,3091,3095,3096,3122,3123,2567,3006,3004,3099,3101,3102,2493,2527,3097,3100,3050,3098,2733] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [3173,3149,3617,3908,3172,3907,3918,286,298,3648,3649,3917,3641,3643,3638,3645] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1614,1612,1610,1611,1613,1615,1616,1618,1120,1637,1638,1351,1353,1354,1355,1628,1264,1265,1617,1119] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1614,1612,1120,1638,1354,1100,1250,1325,1329,1119,1264] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        