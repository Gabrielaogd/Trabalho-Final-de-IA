
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
        
        load "data/2ehuB.pdb", protein
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
 
        load "data/2ehuB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5545,5511,5514,5536,5537,5576,6099,6100,6322,5570,5574,5604,5191,7933,7934,5158,5159,5548,6324,6323,5155,5180,5128,5129,7930,4116,6102,6103,6105,6110,5508,6097,5503,5720,5523,5525,5728,5711,5712,5718,5504,5999,6161,6163,6132,6091,6093,6133,6914,6903,6892,5719,6151,6153,6134,6155,5936,5937,5938,5939,5940,5943,5944,5933,5966,5968,5969,5972,5538,7319,7320,7322,7323,7324,7321,6569,6104,6321,6331,6106,6111,7305,6109,6115,6119,6123,6126,6942,6944,6570,5547,6576,5111,5112,5549,5113,6564,5106,7849,7851,7852,7850,7847,7799,7846,7931,7791,7792,7793,7794,7795,7798,5101,5130,5105,5100,5103,7808,7807,4134,4136,7789,6494,7774,7775,7301,7506,7297,7300] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [6510,6511,6783,6850,6852,6492,6520,7789,6485,6490,6509,6494,6495,6487,5106,5110,5082,5083,6849,6847,5111,5113,6564,5101,5105,5100,5102,5103,5104] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [5439,5461,5453,5291,5301,5305,5306,5432,5434,5307,5308,5310,4776,4783,4785,4788,4818,4845,5648,4811,4815,4784,4793,4805,5281,5440] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [6334,6333,7884,7897,7898,7905,7888,6146,6318,6137,6138,6139,6140,6171,6168,6169,6170,6172,6173,6174,7882,7875] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [6883,4522,4519,4523,4524,4536,5727,5714,6891,6898,6893,4525,7144,7146,5715,4509] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [4444,4438,4439,4440,4441,4442,5796,4355,4356,5799,4376,4370,4386,4387,4362,4437] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [6342,6580,6591,6592,7302,7314,7328,7304,6559,6546,7315] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        