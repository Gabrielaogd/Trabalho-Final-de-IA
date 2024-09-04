
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
        
        load "data/1gqyB.pdb", protein
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
 
        load "data/1gqyB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4523,6260,6263,6264,6265,6266,6236,6239,4517,4518,5009,4520,5022,5025,5006,4998,5327,5321,5324,6262,6284,6285,6258,5824,5306,5319,5315,5316,4524,4548,5799,5802,5804,5811,5812,5833,5803,5772,5773,5795,5796,5832,5798,5778,6207,6208,6221,6222,6291,6228,6569,6046,6047,6043,6044,6045,6053,6057,5780,4534,4535,4505,4536,4540,4541,4706,4858,4870,4872,4871,4509,6233,6267,6231,6234,6494,6242,5143,5144,4507,4511,4512,5021,4886,4877,4880,4882,5040,5041,6492,6493,6495,6530,5102,5103,5104,5114,5034,5028,6215,6217,6219,7086,6232,6456,6457,3791,6451,6491,6466,4708,6049] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [3793,4367,4872,4700,4854,4693,4695,4705,4706,4707,4709,4855,4856,4857,4858,4699,3786,3788,3789,3790,3792,3809,4768,4708,4710,3791] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [3792,3972,3809,4765,4766,4768,4708,4710,4717,4706,4707,4709,3793,4700] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [4597,4598,4624,4625,4687,4781,4663,4782,4783,4740,4747,4741] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        