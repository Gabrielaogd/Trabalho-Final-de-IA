
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
        
        load "data/3ciwA.pdb", protein
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
 
        load "data/3ciwA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [882,883,884,885,888,889,468,467,892,1110,893,451,2357,450,2350,1098,2373,2351,2355,433,2336,2337,1097,435,1112,1348,1504,540,1121,1122,901,904,1437,1133,506,520,521,524,1323,1324,1632,1863,1864,1319,1858,2177,2179,1307,1309,1310,1626,1306,1854,1848,1850,1286,2158,2482,2484,2485,2481,2493,2495,552,565,566,1897,555,557,559,1347,1649,1650,1892,579,580,535,1325,1326,1327,1876,2190,2192,2187,2200,1877,1878,2204,1882,2197,2198,2496,2514,2193,2460,2432,2513,2434] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [945,922,927,929,972,973,980,982,739,696,908,912,680,477,690] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [2160,2766,2768,2784,2778,2781,2782,360,2330,373,374,370,372,2785,418,419,2786,399,397,401] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [2528,2260,2262,2343,2630,2665,2273,2198,2540,2595,2625,2567,2568,2598,2597,2349,2360,2346,2350] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [2816,2821,2146,2147,2801,2806,1821,1822,1823,2138,2139,2822,2824,1794,1796,2126,2132,1791,2793,2791,2792,2812,2814] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        