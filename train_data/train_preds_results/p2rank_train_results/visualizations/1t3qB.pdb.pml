
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
        
        load "data/1t3qB.pdb", protein
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
 
        load "data/1t3qB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2886,3718,5319,5322,5326,4790,5316,5318,2906,2908,3699,3704,3705,2942,3719,4826,4876,4877,5305,5307,4827,1863,1872,1875,1878,5337,5341,5081,5352,5353,5356,5338,5062,6256,5103,5102,5104,5360,6223,6224,6226,6227,2878,5054,5067,5317,5057,5059,5063,5064,5292,4881,4896,5290,5306,5308,2901,2933,2934,2935,2943,2963,6219,6207,6212,6750,5330,5331,5334,4023,4024,6780,4004,6778,3711,3714,3716,3717,3751,3739,3740,3745,3746,3783,3703,3710,1886,3741,4007,4009,4011,5335,5336,4008,4010,6768,6769,6770,6771,6777,6283,6285,6286,6766,3141,3116,3104,3105,3106,3107,3110,3112,3114,3115,5052,3990,4038,4039,4772,3782,3781,4851,4862,4861,4863,6757,6760,6264,6765] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [5048,5047,5076,5055,5056,1377,1373,1374,1355,5043,5046,5082,5083,5086,5087,5225,5088,5089,5090,5222,5033,5236,5240,5238,5239,3083,1411,1466,1467,3081,1410,3068,3072,3073,3077,3085,3088,1401,1400,3067,3066,3071,5052] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [2295,2299,3450,2303,2287,3453,3960,2292,2636,6401,6406,6411,6416,6418,6421,6422,2628,2627,2302,3469,6965,2307,2311,3470,3471] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [4555,4587,4125,4124,4155,4156,4202,4581,4622,4621,4579,4709,6878,6880,6881,6882,4209,4211,4713,4127,4126,4201,4184,4185,4190,4191,4194] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1662,1785,1666,1667,1669,1787,2002,2003,1647,1644,1786,1791,1795] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [4972,4988,4977,4978,4979,5729,5733,5737,5177,5185,5203,5631,5726,5633,5719] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1965,1966,3175,1977,3972,2042,2055,2059,2063,3176,2070,3183,3184,3185,3412,2053,3406,3408,2068] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        