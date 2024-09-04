
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
        
        load "data/3ondB.pdb", protein
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
 
        load "data/3ondB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5758,5759,6685,5978,5936,5946,5745,5746,5751,5752,5753,5789,5199,6893,6887,6890,6899,6900,6903,5736,5739,6018,5158,5159,7371,7398,7400,7370,6888,4721,5155,5161,6906,6907,6908,6909,6904,6905,5173,5174,5175,5419,4982,5468,5201,5418,5440,5442,5435,5438,4537,4536,4729,7270,7271,7272,6902,7259,7260,6901,6910,6917,6919,4535,4532,7295,7296,4575,4551,4528,4531,4719,4969,4730,4736,4966,4968,7262,4934,5430,5431,5432,5433,5429,5434,5948,6673,6684,6245,6408,6678,6681,6683,6886,6725,6726,6578,6720,6722,6569,6017,6061,7328,7329,7330,7331,7332,6279,6880,6277,6882,7288,7323,6262,6261,6418,6679,6680,6455,6246,6412,6416,6417,6425,6695,6424,6426,6024,6025,6026,6271,6272,6263,6265,6269,6273,6407,6406,6562,6566,6577,6556,6559,6561,6292,6410,6411,6434,6431] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [7357,7361,7363,7353,7355,7356,7350,7777,6043,6044,6045,6047,7337,7338,4325,6007,6009,6010,6049,5969,7383,7715,7746,7712,7733,6050] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [6008,6009,6010,5961,5969,7715,7746,8033,8034,8036,8038,8039,7967,7954,7682,7683,7680,7686,7687,7691,7692,7694,7951] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [4293,4271,7317,7326,7334,7340,7337,6081,6082,7344,7345,4323,4324,4325,4291,4270,4557,4266,4267,4269,4559,4558,4770,4569,4297,4298,4301] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [4372,7437,7438,7460,7458,7407,7439,4408,4409,4397,4407,7703,7676,7677,7669] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [5819,5820,5788,5779,5780,6687,6689,6690,6694,6696,6703,6705,6707,6709,6906,6908,6909,6898,6701,6897,6930] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [5019,5020,4991,4993,5493,5513,5514,5515,5520,5521,5034,5516,4948,4044] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [5962,7685,7655,7659,8009,7978,7658,5984,7639,7981,7983,7651,7652,7635,5941] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [5199,5826,5827,5828,5191,5197,5223,5237,5786,5819,5787,5788,5165,5167,5785,5849,5816] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [4891,4894,4163,4156,4893,4895,4048,4958,4039,4149,4151,4890,4892,4889,4161,4166] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        