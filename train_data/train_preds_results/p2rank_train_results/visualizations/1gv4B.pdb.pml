
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
        
        load "data/1gv4B.pdb", protein
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
 
        load "data/1gv4B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6181,6182,6183,6306,6307,6308,5026,4139,5019,5021,5023,5024,5025,5010,4848,4851,5920,6531,6533,6302,6303,6304,6309,6310,6311,6319,6535,4136,4149,4150,4166,4170,4171,5246,4137,5014,5016,5226,5227,5885,5886,5887,5888,5880,5878,5882,5883,5874,5875,4889,5213,5215,5209,5431,5206,5448,5450,5204,5207,5203,5205,5220,5221,5224,5228,5198,5201,5876,5406,5407,5408,5398,5399,5195,5653,5656,5663,5669,5667,5666,5430,4845,4834,4835,5917,4838,4839,4840,4841,4843,4078,4079,4081,4069,4072,5932,5936,5942,4625,4627,6323,6320,3899,3903,3904,3906,3910,6351,6176,3896,4116,4120,4138,4140,4141,4122,4123,3897,3891,3894,3895,3885,3887,3888,4055,4632,4064,4065,6300,6316,6317,6318,6299,5456,5458,6651,5446,6277,6279,6255,6646,6173,6170,6529,6530,6539,6543,6546,6548,6532,6534,6545,6547,4180,5245,5217,6627,6626,6625,6639,6654,6648] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [6382,6384,3950,6881,6885,6888,4390,4132,6879,6335,6877,6919,6357,3923,3928,3931,3949,4427,3925,4420,4422,4425,6358] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [5523,5525,7071,7092,7093,7095,7252,6722,5489,6720,6721,6723,7097,5486,5487,5488,5501] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [4188,4189,4179,6854,6862] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        