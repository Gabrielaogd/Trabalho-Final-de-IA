
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
        
        load "data/3fg0C.pdb", protein
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
 
        load "data/3fg0C.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [10110,10112,10168,10120,10121,10122,10123,10128,10124,10125,10126,11463,9508,11034,11477,11479,11005,11476,10199,9481,10002,10197,10004,10003,10187,10189,10166,10167,10144,10152,10156,10160,11032,10011,10138,10142,10116,9486,9564,9566,10119,9494,9495,9518,9516,9517,11482,11480,11481,10302,10580,9734,9730,9503,9505,9743,9744,9745,9506,9705,9706,10998,11001,11003,10964,10983,10987,10989,10997,11030,9969,9970,9971,9972,9973,9975,9732,9736] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [9055,9083,10529,9053,9056,9057,9060,9015,9090,9115,11934,11936,9114,10528,10530,10531,10532,11935,11913,11926,11929,11932,11912,11901,9518,9516,9517,9525,9527,9528,9529,10568,10566,10526,9564,9566,9570,10580,10583,11914,11915,11917] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [8409,10865,10863,8962,8396,8397,10876,10878] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        