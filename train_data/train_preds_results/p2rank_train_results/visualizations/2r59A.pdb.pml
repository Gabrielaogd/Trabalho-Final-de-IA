
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
        
        load "data/2r59A.pdb", protein
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
 
        load "data/2r59A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2290,2323,3008,2287,2518,2546,2555,2556,3005,3006,3007,3021,2451,2490,2973,3009,3011,2098,3010,2288,2976,2977,2981,2986,2985,2450,2971,2972,2448,2961,2963,2964,2967,2968,2969,2966,2970,3000,2998,2999,2870,2962,2843,2887,2091,4496,4493,4503,4507,4502,4508,4511,4495,4540,4542,2080,2086,2088,2089,4506,2075,2939,2946,2950,4815,2257,2258,2260,2547,2253,2582,2286,2285,2299,2092,2266,2267,2114,1055,1056,1057,2105,1052,1053,2447,2449,1063,2413,2416,2419,2903,2446,2445,2412,2452,2888,1059,2937,2940,2686,2687,2688,2689,3947,2647,2648,2649,3945,3946,3948,3949,2683,2645,4242,4243,3974,2259,4244,2246,4240,4241,2236,4229,2234,2227,2252,1843,2612,2613,2614,2615,2616,2610,2611,2680,3941,3943,3940,3972,3937,3971,3939,2736,2685,2704,2707,2734,2705,2706,2708,2733,2697,2698,4004,4006,4007,3982,3983,4015,4016,2700,2702,2701,3676,3724,3726,3677,4273,4283,4512,4513,4514,4515,4031,4282,4274,4510,2735,2737,2758,2759,2760,2762,2761,2725,2726,2754,2717,3634,4314,4316,4549,4550,2790,4586,4027,4029,4033,4037,4038,4039,4040,4349] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [865,868,852,4779,434,435,2935,1069,1080,618,621,443,599,620,4788,4777,4778,4805,4806,4808,4782] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        