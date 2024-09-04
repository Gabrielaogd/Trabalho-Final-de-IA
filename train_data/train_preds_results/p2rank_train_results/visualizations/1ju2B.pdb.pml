
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
        
        load "data/1ju2B.pdb", protein
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
 
        load "data/1ju2B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4790,4846,4866,4868,7562,7567,7558,7570,7552,7559,7560,7565,7576,7578,7867,4299,4300,4303,4837,4840,4842,4843,4844,4845,4847,4805,4308,7776,4307,4310,4315,7780,7901,7899,4448,4449,4863,4870,4873,4874,4876,4882,4889,7869,7856,7873,7874,4886,4864,4877,4881,7859,7861,7553,4890,6459,6460,4787,4795,7587,7589,7582,4797,4799,6009,6026,6030,6031,4455,4456,4457,4458,6012,6015,6020,6003,6007,6008,6010,6011,6033,4289,4292,6064,4454,4436,4450,5706,5709,5705,6331,6662,6664,6779,6567,6569,6566,6461,6555,6055,6968,6056,6933,6936] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [6825,6826,7841,7830,6539,6824,6505,4951,4953,4950,7819,7818,4930,4933,5408,7842,7837,6494,6499,6538,6503,6506,6509,5418,5419,7820,7821,7823] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [7819,7802,7803,7818,7838,7892,7805,7806,4951,4952,4953,4954,4980,4983,4950,7902,7903,7830,7821,7801,7813,7814,7804,4977] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [6570,6572,6583,6443,4555,6584,6589,6590,6591,6440,6437,6438,4575,4579,4581,4878,4880,4569,4571,5489,4550,4568,6448,6453,4553] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [7823,7621,7812,7813,7814,6301,6300,6839,7825,6280,6282,7641,7642,6859,6860] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [5141,5143,5146,5570,5599,5135,4090,4093,4051,4067,5575] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [6454,6453,4551,5518,5495,5194,5197,5503,5510,5511,5517,6436,6441,6442,4558,5211,5210] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        