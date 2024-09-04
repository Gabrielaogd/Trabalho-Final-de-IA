
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
        
        load "data/2pgoB.pdb", protein
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
 
        load "data/2pgoB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [7838,7938,7949,7950,7951,7775,6515,6519,6521,6334,6333,6507,6520,6335,6337,6783,6784,6785,8155,8166,8165,8373,8374,5125,5127,5153,7903,6338,6357,6358,6359,6336,6340,6356,6365,6368,7113,7115,5344,6800,5319,7954,7956,6799,5354,6797,6798,6796,7004,6971,6983,6970,5345,5346,5363,5365,5350,5351,5352,5839,5829,5835,5824,5826,5827,6977,7946,7948,7970,7983,7984,7985,7772,7986,8167,6829,6835,6837,6836,6640,6641,6815,6816,6827,6839,6828,6840,6792,8439,8438,8418,7771,7774,8431,8412,8413,6513,6628,6629,7836,6631,6642,6646,6506,6508,6791,7776,7777,7780,8979,8427,8980,7804,7794,7784,8408,8423,8394,6509,6514,6625,7594,7788,7792,8937,8395,9054,8469,9055,5120,5122,5114,6360,6361,6097,6098] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [4833,4834,4836,4816,4821,4863,5006,5008,4890,4916,5199,5200,4862,4815,4895,4914,4921,4922,4925,4893,4896,4991,4990,4992,5007,4965,4963] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [6894,6846,6890,6895,6884,6896,6901,6899,6900,6864,9027,9028,6689,6714,6715,6718,6719,6722,6713,6690,6692,9017,6626] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [6620,6621,7834,7832,7833,6649,6568,7831,6658,6660,7924,6530,6567] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [7857,7859,7535,7667,7491,7498,7536,7433,7467,7465,7466,7464,6664,6663,7454,7842,7463,7666,6575,7858] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [5524,5521,5468,5469,5529,5546,5548,5656,5653,5655,5551,5441,5467] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        