
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
        
        load "data/3fv3F.pdb", protein
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
 
        load "data/3fv3F.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [14890,14892,13464,13475,13476,14880,14153,14154,13448,13449,14097,13463,13465,13481,14150,13314,14903,13316,13307,13306,14085,13469,14704,13820,13821,13824,13825,13826,13827,13837,13836,13818,13819,13810,13796,13805,13808,13809,13811,13816,13817,13790,13792,14168,14067,14069,14073,14074,14076,14896,14863,14864,15502,15520,15503,15505,15504,14707,14897] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [15576,14477,15354,15355,15382,15384,15388,14904,14912,15537,15344,15351,15372,13299,13301,13287,14476] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [15030,15033,14790,15196,15201,15337,15338,15340,14781,15235,15032,15168,15362,15364,15450,15336,15361,15212,15363] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [14139,15646,14140,14407,14128,14134,14404,15661,14305,14310,14280,14309,14307,14332] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [14897,14929,14898,14902,14904,14911,14930,14896,15385,15386,15440,15137,13824,13827,14890,14892,14903] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [14594,14595,15780,15758,14522,15763,13250,14523,14539,14573,15798,13249] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [15621,15815,15816,15641,15681,15696,14633,14631] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [15504,14721,14723,14725,14683,14861,15502,15509,14851,15506,14849,14848,15499,14677] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        