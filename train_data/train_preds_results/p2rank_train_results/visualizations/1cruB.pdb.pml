
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
        
        load "data/1cruB.pdb", protein
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
 
        load "data/1cruB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5338,5449,5450,5451,6243,6441,6711,6217,6219,6185,6186,6187,6188,6189,6190,4654,4642,5323,4095,4096,4097,4649,4644,4834,4833,4841,4842,4094,3720,3721,3722,3866,4088,4092,4093,6246,6439,6443,6444,6687,6688,6831,6447,6449,6851,6852,6191,6845,6848,6855,6829,6830,6842,5447,6242,5455,5459,6232,6233,5469,5313,5457,5460,6710,3865,3727,3739,3719] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [5792,4840,4842,4830,5794,5796,4834,4841,4831,6219,5809,5457,5460,5682,5819,5820,5821,5684,5689,5827,5828,5795,5806,5312,5313,5593,5469,5459,4810,4820,4821,4825,4822,5724,5703,5707,5706] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [4133,4678,4688,4142,4145,3761,4671,4672,3760,3765,4149,4687,4690,5363,5347,5356,5357,6269,4693,6279,6733,6735,6740,3762,3766,6277,6281,6283,6286,6287,6310,6748] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [5006,5020,5032,5019,5033,5036,5037,5038,4590,4331,4368,4327,4332,4343,4344,4346,4309,4588,4308,5013,4337,4320,4323,4907,4908,4910,4600,4604,4798,5068,4609,4372,4606,4371,4814,4815,4369,4383] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [6130,6131,6132,6204,6093,6095,3546,3547,6460,3529,3528,3535,3522,3523,3524,6871,6206,6144,6146,6145] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [3623,3633,3624,3603,3607,6626,6635,6636,6369,6372,6501,7029,6353,6367,6348] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [5393,5395,5403,5407,5529,5366,4707,4752,4753,5104,5272,5273,5274,5541,5545,5105,5547,4716] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [4657,4662,4663,4664,4670,5334,6257,3740,3734,3738,4121,4672] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [4920,5601,5602,5700,5701,5609,5610,5715,4897,4932,4934] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        