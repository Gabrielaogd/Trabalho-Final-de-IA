
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
        
        load "data/3ahdA.pdb", protein
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
 
        load "data/3ahdA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1199,1676,1678,2512,2513,1671,1215,1400,1401,1403,1399,757,1397,1663,1666,2351,1644,1653,1214,1388,1623,1107,1108,498,499,754,2521,742,522,523,755,758,1645] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [4694,4556,4557,5311,4537,4538,4718,4734,4717,5310,5353,5324,4513,5393,5395,5411,5392,4527,4469,5326,4508,4468,5410,4719,4911,5336,5335,4662,4663] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [4016,4019,4043,1228,4044,1203,1260,1181,3826,4018,4041,4042,4048,4049,4046,4076,4082,1183,1187,1192,1168,3859,1174] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [6307,6311,6314,6316,6309,5148,6328,5952,6302,6313,4305,4307,5858,5857,5856,4783,4786,5116,5137,5138,5139,5115,3204,4790,3205] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [6293,5961,5965,5963,5988,6133,6100,5946,5948,5949,5950,5167,5168,5169,5947,5188,5189,5190,5193,6331,6333,6152,6153,6155,6151,6122,6125,6295,6297,6298] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [3673,3674,3572,3594,3646,3424,3729,3551,3555,3571,3569,3570,3547,3721,3724,3725,3549,3573] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [2376,1952,1960,1967,1981,1982,1983,2364,1927,1944,1950,1951,1929,2397,2398,2463,2371] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [3878,1306,2988,2989,2990,1,2984,1317,1326,692,2953,2954,1331,2,13,15,2945,2986] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [240,2374,2706,2708,2699,2697,1982,172,213,1980,214] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [1640,1647,1659,1641,1660,2467,1733,1734,1735,1725,1633,2323,2465,2446,1936,1938,1940,2332] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [4332,4333,4323,3452,4266,4777,4776,3469,4318,4316,4317,4302,4319,3940,3941,4344] 
set surface_color,  pcol11, surf_pocket11 
   
        
        deselect
        
        orient
        