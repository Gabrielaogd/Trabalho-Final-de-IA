
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
        
        load "data/2ob0C.pdb", protein
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
 
        load "data/2ob0C.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3083,3088,3089,2688,2690,2692,2725,2949,3082,2758,2760,3092,2682,3098,3099,3100,3101,3106,2936,2937,2943,2870,2944,2541,3179,3063,2721,2723,3590,3591,2708,2962,2963,2964,2966,3385,3411,2707,2700,2701,3603,3601,2679,3144,3145,3146,3147,3140,3143,3388,2756,3057,3068,3069,3362,3468,3093,3094,3096,3209,3182,3454,3455,3456,3457,3458,3181,3170,3190,3169,3176,3380,3375,3410,3428,3431,3427,3452,3453,3424,3426,3150,3151,3156,3425,3064,3364,3367,3368,3061,2958,3381] 
set surface_color,  pcol1, surf_pocket1 
   
        
        deselect
        
        orient
        