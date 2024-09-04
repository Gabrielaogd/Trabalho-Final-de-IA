
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
        
        load "data/1h1lC.pdb", protein
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
 
        load "data/1h1lC.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [10895,10901,10911,11048,11049,11050,8093,9069,8112,8108,8109,10910,9356,9358,9742,8168,8169,9097,9096,8358,9349,9353,9374,9376,9342,9347,8355,8356,8357,11047,10364,10368,11045,11051,11052,10555,11053,10892,10554,10369,10372,10564,10565,10566,9714,9731,10380,9732,10373,10374,10376,10383,9340,9713,9705,10391,10392,11131,11132,10384,10388,10389,10390,11039,11058,11034,8351,8354,8325,8328,8315,8316,8160,8138,8117,8129,8131,8139,8116,8813,8296,8319,8321,8294,8297,8298,8808,8812,8820,8349] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [10408,10409,10629,10405,9914,9917,9966,10407,10664,10665,10419,10421,9893,9896,9901,10410,9900,9899,9988] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [8191,8378,8379,8456,8466,8467,8478,8162,8153,8189,8240,8241,8190,8244,8158,8331,8341,8157,8350,8327,8160,8342] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [8713,8722,8724,8677,8680,8682,8683,8686,8653,8495,8492,8502,8654,8505,8497,8689] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [10968,11249,11250,11024,11242,10929,11008,11081,11080,11079,10928,11077,11078] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [9766,9768,10578,10580,9075,8027,9104,9106,9076,9077,9080,9082] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        