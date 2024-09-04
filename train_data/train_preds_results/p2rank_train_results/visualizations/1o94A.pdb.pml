
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
        
        load "data/1o94A.pdb", protein
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
 
        load "data/1o94A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [230,1349,1759,2342,2344,2523,244,247,238,239,2559,2528,235,2527,2545,2518,2799,457,461,462,463,464,465,466,1328,1366,1367,802,1347,1330,803,248,249,2797,533,534,2768,2762,2770,2081,2082,2084,2085,2112,2079,2078,2080,1346,1348,2107,1345,2103,2109,2106,2533,2535,2536,2349,2800,559,2056,2058,1011] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [3786,3331,3797,5005,5006,5007,3794,3324,3325,3328,3329,3322,3323,3349,3282,3294,3289,4999,5280,5003,4996,4997,3816,3818,4017,3805,5278,5279,5255,5283,5285,5286,5327,3127,3128,3136,3137,3321,3330,3781,3784,3790,3791,3143,3122,3281,3283,3118,3119,3277,3787,3789,5302,5307,3333,4187,4189,3365,3327,5299,5300,4158,4159,4160,4165,4153,4156,5295,3821,4197,4041,4150,4171,4173,4175] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [2741,2867,2558,2862,2736,2724,2732,2723,2719,2742,2762,2532,2556,2531] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [2991,2998,3181,3487,3523,3214,3546,2661,3002,2687,2688,2689,2690,2691,2623,3215] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [2785,5320,5322,2855,2946,2853,2916,2860,5313,2890,2857,2902,2882,5340,5341,5342,5344,5345,2957,5291] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [282,283,588,613,642,5595,611,643,5593,5592,5594,622,590,897,284,278,280] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [4395,4396,4398,4411,2062,1006,1004,4421,4424,4454,4455,2805,2809,1010,1012,1013,1021,1020,4427] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [5302,5306,5310,5299,5295,5298,4173,4175,2740,2741,2868,2869,2756] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [362,723,759,760,332,335,2921,368,391,2985,2920,2982,2967,2966,2978,2979] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [398,2614,2639,164,176,2638,387,166,400,78] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        