
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
        
        load "data/2wpfD.pdb", protein
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
 
        load "data/2wpfD.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [12668,13359,13663,13664,13665,13360,13361,12387,12381,11532,11533,11534,11535,11559,11506,11528,11562,12518,12400,12402,13384,13385,13386,13387,12376,13382,11427,12119,12121,13409,13412,13724,13749,11269,11270,11271,11272,13655,13658,13649,11265,11261,11262,11525,11253,12371,12374,12375,12377,12379,11250,11421,11415,11419,11420,12108,11410,13418,12126,13420,12123,11567,11571,11572,11595,12667,11564,11565,11591,11592,11594,13736,13737,13728,13729,12674,12676,12675,12511,12697,12706,12708,13711,13712,13723,13946,13950,13949,12663,12664,12666,13968,11600,11602,13967] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [12663,12922,12923,12924,12664,12666,12656,12658,13349,13350,13707,13711,13712,13723,13944,13945,14012,14015,13949,13722,13931,12839,12841,12655,13339,13343,13344,13358,13353,12667,12676,13351,13352,14040,12902,12911,12913,14011,14014,14016,14017,14022,14025,12899,12903] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [11689,11690,11688,11717,14214,14454,14455,14457,14224,14215,11652,11650,13981,14287,11677,11647,11648,14456] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [11309,11310,11312,11315,12008,12010,11989,11987,11983,11984,11985,11986,11283,11286,11287,11288,11281,11282,11305,12019,12021,12065,12066,11285] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [11652,11650,13981,11633,11651,11604,11603,13966,13995,14458,14451,14456,11689,11690,14454,14455,14457] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [14698,14731,14643,14644,14645,14699,14724,14519,14616,14536,14486,14512,14489] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [13970,13971,13975,13979,13980,13982,13042,13045,13978,13025,12693,13961,12716] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [11539,11547,11989,11988,11540,13730,13757,11266,11268,11285,11523,11283,11287,11270] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        