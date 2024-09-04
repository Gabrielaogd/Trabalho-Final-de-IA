
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
        
        load "data/3peyA.pdb", protein
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
 
        load "data/3peyA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2599,2612,2613,2614,2615,2880,423,424,425,426,434,2887,2890,2892,2888,447,451,452,454,458,764,763,435,438,239,152,174,176,153,156,175,172,170,171,2889,2891,2893,167,1286,2596,2597,2823,2825,1276,1277,418,446,1571,445,442,733,789,2611,2911] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [1294,1295,1337,1339,1341,1343,1582,1590,1591,1594,1595,1765,1602,1354,1358,1299,1306,2586,2588,2590,2789,1301,1304,392,1576,1578,1579,1792,1744,1627,673,1307,2548,2549,2554,2555,671,672,2582,2557,2795,2796,2777,2776,2785,2553,3111,3100,1767,2727,2738,2737,2784,2783,3099,3101,2573,2550] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [2730,3045,1917,2986,2987,2994,1913,3017,2729,2122,3012,2115,2702,2705,2706,2707,2708,2121,2146,2147,2709,2712,2713,2714,1915,1919] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [2974,1879,1880,1882,3080,3081,3051,3053,3025,3027,3059,3055,3149,1864,3146,1861,1863,1865,3164] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [1061,1063,671,1386,1059,1060,1406,1407,908,1068,907,1051,1050,1049] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        