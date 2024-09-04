
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
        
        load "data/3t6eM.pdb", protein
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
 
        load "data/3t6eM.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8535,8537,8557,8558,8564,8536,8393,9172,8384,8410,8390,8387,8389,8392,8473,8475,8413,8470,8421,8422,8529,8532,8516,8517,8528,8146,8176,8147,9146,9120,9129,9144,9147] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [8873,8903,8904,8905,8906,8907,8908,8909,8910,8911,8673,8674,8675,8952,8966,8967,8872,8620,8626,8628,8647,8649,8650,8651,9017,8983,8988,9015,9016,8656,8995,9044,9045,9046,9047,9048,9049,9051,8980,8846,8875,8876,8982,8874,8969,8976,8978,8979] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [8291,8292,8178,8179,8180,7872,8158,8162,8188,7837,7838,7839,7840,7810,7813,8267,8266,7865,7866,8308,8310,8312,8153,8154,8176,8151,8174,8298,8293,8353] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [7396,7397,7398,7430,7370,7892,7372,7865,8308,8310,7422,8306,7421,7864,7863,7890,7390,8314,8315,8324,7468,7599,7600,8313] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [8608,9055,9056,9097,9098,9021,9054,9057,8638,8639,9014,8604,8606,8607,8636,8623,8625,8629,8630,8633,8634,8635,8624] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [8124,8161,8125,7930,7903,8107,7931,7932,7933,7934,7935,7936,7937,8082,7938,8106,8104] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [7309,7313,7314,7318,7319,7306,7946,7295,7074,7076,7108,7294,7949,7982,7983] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        