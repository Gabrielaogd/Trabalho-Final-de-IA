
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
        
        load "data/2oalB.pdb", protein
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
 
        load "data/2oalB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4546,4557,4559,4526,4531,6805,6824,4527,5597,5595,6041,6043,6823,6034,4504,4505,6051,6053,6021,6031,6979,6984,6985,4324,6025,6026,6027,6028,4489,4486,4490,6067,5778,5784,6066,4305,4302,4472,4299,5788,5790,4310,4313,4317,4318,4319,4320,5618,4309,4307,4308,4335,4337,4484,4485,5653,7018,7011,7013,7014,7057,7061,4558,7032,7056,7035,7036,7037,6240,6459,6458,6845,6843,7109,7001,7099,6976,7068,7069,7070,7071,7072,7073,7077,5586,5588,5589,5590,5617,5592,5616,5619,5620,5624,5625,5626,4563,4552,4560,6477] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [5057,5059,7859,7861,4576,4578,5052,4805,4825,5038,5041,5043,5044,7951,7966,7053,7975,7989,7996,5054,5065,7974,7848,5073,7946] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [8061,5296,8077,8045,8046,5194,8047,5302,5295,5193,5292,5298,8048,8049,8051,5315,4884,5204,5231,8078] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [5524,5531,5533,5499,5501,5523,7855,7856,4583,7858,4618,7853,7854,7863,7864,7829,4584,5527,4607,4699,4608,4653,5532,5534,5552,5453,7824,7827] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [6290,6292,6326,6327,6328,6329,6469,6721,6723,4928,6732,6525,6526,6274,6279,6714] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [7147,7149,4375,4377,4622,4660,4662,4664,7141,7143,7173,7174,7176,7177,7180,7879,4615,4620,4658,7866] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [6366,4834,5420,6367,5406,4991,5403,4926,4930,4938,4942,4853,6380,6349,6467,4992] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [4546,4559,4526,4531,6805,6824,5598,5584,4556,4550,5582,5596,4547,4537,4540,5588] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [5368,5356,5357,5358,5359,5360,5352,5089,5090,8283,8284,8286,8287,8252,8253,5070,5072,5069,5505,5510] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [7916,7919,7356,7361,7364,7365,7921,7922,7358,7947,7950,7960,7926,7927,7943,7394,7954,7392] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [4795,8407,8408,8445,5453,5451,4707,4706,4708,5484,4700] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [7003,7095,7131,6975,6996,6997] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        