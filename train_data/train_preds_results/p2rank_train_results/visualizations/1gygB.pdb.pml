
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
        
        load "data/1gygB.pdb", protein
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
 
        load "data/1gygB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3487,3489,3491,3750,3786,3478,3479,3481,3482,3486,3747,3530,3567,3564,3814,5119,5120,5465,3473,3475,3477,5446,5449,5450,5451,5447,5448,3470,3480,3527,3823,3824,3825,3459,3422,3426,3430,4012,4013,3979,3980,3542,3544,4045,4047,3429,3428,5460,5453,5378,5459,3488,3490,3957,3990,3991] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [5085,5081,5088,5086,5087,5089,5076,5077,3639,3636,5821,5827,5084,5811,4521,4523,5829,5814,4526,4529,4558,5055,4505,5056,3775,3802,3806,3776,3807,3803,3757,3606,3758,5104,5484,5485,3740,3735,3628,3635,3797,3798,3799] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [5118,5799,5781,5783,5800,5870,5886,5887,3955,3957,3990,3881,3913,3989,3991,3927,5135,5449,5450,3956] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [4423,4427,4429,4461,4575,4577,4536,4538,4569,4452,4605,4606,4607,4608,4609,4610,4881,4600,4597,4598] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [4128,4129,4109,4111,4112,4708,4714,4667,4669,4210,4717,4219,4223,4214,4705,4710] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [3541,3438,3539,4071,3528,3535,3555,4238,3525,4237,4192,3526,4187,4199,3524] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [5369,5370,5371,5353,5354,5355,5213,5194,5692,5694,5691,5693,5215,5217] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [3717,3719,3681,3683,3679,3682,3686,3684,3669,3690] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [3831,3830,4026,3999,4951,4949] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        