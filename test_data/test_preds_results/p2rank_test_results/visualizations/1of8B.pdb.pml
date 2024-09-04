
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
        
        load "data/1of8B.pdb", protein
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
 
        load "data/1of8B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4278,4279,4509,4510,4518,4519,3277,3755,3759,3760,3765,3768,3949,3951,3932,4513,4515,4516,4517,2962,3252,3253,4934,4935,4936,3268,3269,4926,4928,3225,3606,3259,3260,3257,3267,3249,4511,4521,3948,4287,4288,4290,4295] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [4095,4091,4093,3668,3636,3810,3812,3845,3637,3813,3816,3635,4108,4111,3667,3867,3868,3869,4171,4175,4116,4121,4099,4105,4180,4176,3853,3638,3851,3877,3871,3693] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [4023,4438,4439,4207,4213,4214,4215,4022,4025,4026,4048,4024,4234,4238,4248,4453,4440,4441,4446,4449,4429,4430,4032,4434,4002,4000,4004,4444,4445] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [3631,3338,3455,3347,3425,3426,3427,2628,3244,3677,3242,3628,3630,3340,3341,3344,3314,3315,3231,3240,3241,3645,2629,3643,3646] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [2955,4783,3017,3015,4784,3016,4898,4899,4901,2985,2976,3018,2966,2983] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [3115,3091,3565,2823,3145,3092,3122,3147,3148,3149,3179,3176,3171,2906,2787,2824] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [3652,3654,3615,3598,3234] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        