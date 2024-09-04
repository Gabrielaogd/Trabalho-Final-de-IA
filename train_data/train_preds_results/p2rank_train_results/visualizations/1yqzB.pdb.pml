
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
        
        load "data/1yqzB.pdb", protein
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
 
        load "data/1yqzB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5718,5719,5720,5846,5847,5848,3809,3810,3811,3818,4539,4542,4543,4544,4416,4419,4422,4429,4541,3744,3745,5439,3752,3812,3792,3801,3804,3805,3807,3813,3817,3558,3799,4554,3564,4407,5710,5880,3560,3561,3565,3569,4410,4405,4409,3545,3743,4411,4412,3542,3544,3583,3555,3556,3575,3577,3782,3554,3557,3559,3553,3735,3736,3737,3601,3576,3600,3784,3785,3961,3968,3970,4019,4060,4751,4741,4747,4749,4750,4757,4758,4759,5395,5398,5415,5397,4434,5388,4531,4533,4535,4537,4540,4528,3808,5841,5414,5400,5405,5406,5409,5401,5408,5713,4732,4737,4738,4915,5399,5402,5403,4972,4973,4974,4975,4925,4916,4933,4945,4982,4981,5853,5854,5857,5888,5889,5890] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [5866,5869,5777,5775,6067,6052,6053,6054,6064,6692,6719,6720,6689,6693,6694,5836,5868,5870,5849,5862,5863,5864,5872,5865,5867,6048,6056,6036,6063,6060] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [4422,4429,4541,3745,3752,3751,3753,4567,4569,4570,4571,4553,4554,4578,4579,4540] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [4592,4593,4624,3895,3896,3889,3856,4614,4613,4615,4652,3854,3898,3875,3901,3877,3911,3910,3916,3918,3948] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [6059,6075,4983,4979,6170,4982,6194,6181,6185,6190,6572,5837,5821,5766,5767,5836,5825,5828,6196,6197,5844,5832] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [6677,6806,6808,6746,6745,6795,6802,6803,6796,6772,6675,6702,6705,6698,6726] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [5709,5628,5712,5732,5733,6045,6047,5875] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [6595,5043,5044,5067,5014,5015,5016,6138,6140,6328,6438,6327,6440,6422,6423,6424,6593,5033] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [4094,4280,4099,4134,4135,4321,4323,4103,4105,4106,4260,4110] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        