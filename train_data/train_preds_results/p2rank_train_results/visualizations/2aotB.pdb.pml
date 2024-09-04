
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
        
        load "data/2aotB.pdb", protein
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
 
        load "data/2aotB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3315,3343,3345,3354,3355,3357,3316,3317,3318,3320,3342,3356,3358,3359,3347,2267,2295,2297,2264,2266,2294,2296,2244,2246,2274,2393,2345,2346,2354,2353,3740,4164,2224,2225,2226,2227,4161,4162,4160,2265,2216,3760,3638,3635,4133,4144,3599,3600,4138,4139,4140,3353,3352,3362,3366,3367,3368,3115,3728,3734,3738,3729,3344,3736,3758,3372,3560,4434,3596,3597,3307,2650,2656,3325,3328,3308,3292,2885,2886,2658,2664,2878,2915,2660,2661,2662,2667,2672,2913,2879,2912,2891,2892,2671,2676,2914,3310,2685,2686,2696,2402,2403,2404,2680,2681,2653,3121,3116,3122,3113,3114,3126,2434] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [3821,3822,3820,3784,3785,3791,3783,3949,3950,3951,3567,3568,3569,3572,3576,3570,3914,3917,3918,3919,3901] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        