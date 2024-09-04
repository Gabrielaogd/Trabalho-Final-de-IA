
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
        
        load "data/3dntB.pdb", protein
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
 
        load "data/3dntB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4526,4489,4490,4492,4493,4496,4527,4508,4500,4501,4505,4485,4696,4695,4711,4712,5001,4999,5000,3774,4491,5648,5649,5190,3780,4065,5039,5174,4063,4064,5038,5040,5213,5005,5012,5022,5633,5634,5635,5656,5804,5620,5278,5279,5288,5290,5790,5791,5793,5789,4713,4775,5797,5798,5801,5803,5820,5795,5674,5644,5645,5188,5031,5032,5029,4812,4813,5030,5028] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [6144,6140,6141,6165,6164,6184,6185,6186,6187,6189,6194,5546,6113,6256,6257,6263,6116,6111,6112,5973,6139,6254,6231,6199,6201,6127,6264,6120,6121,5494,5499,5464,5337,5340,6167,5465,5466,5469,5360,5345,5374,5495,5511,5535,5536] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [3359,3381,3530,3531,3358,3604,4070,4072,4073,4080,4074,3319,3339,3585,3586,3566,3588,3594,3599,3601,5166,5169,5163,5164,5165,3346,3343,3360,5143] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [5566,5341,5538,5945,5948,5947,5962,5564,5623,5625,5565,5622,5953,5949,5292,5951,5952,5502,5339,5332,5334,5365,5326,5331,5971,5973,5627,5628,5636,5274] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [5186,5200,5228,5221,5671,5675,5680,5639,5640,5660,5661,5662,5363,5364,5365,5388,5230,5232,5386] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [5124,5075,5113,5102,5074,4207,4209,5127,5128,4664,4179,4178,4657,4192] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [4166,4649,3325,4101,4104,4103,3326,3328,3329,4100,4108,4137,4132,4148,3322,3324,3327,4086,3321,4088,4087,4650,4159,3341,3342,3347,3348,3350] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [5300,6014,5330,5331,5346,5338,5334,5342,5965,6012,5981] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [4559,5069,5071,4562,4675,4676,4678,5130,4687,4560,5006,5008,5010,5014,5007,4688,5009] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        