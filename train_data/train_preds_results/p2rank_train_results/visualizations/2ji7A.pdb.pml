
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
        
        load "data/2ji7A.pdb", protein
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
 
        load "data/2ji7A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3184,3183,3185,3186,3209,3211,3213,3217,3218,3197,3198,1669,3192,1667,1666,2106,2107,1193,4153,2137,2138,2125,2146,2147,1857,2102,1862,1661,1664,1670,2093,1671,2092,2091,2462,2310,2311,2312,2313,1846,1854,1858,1855,1856,2095,2099,2164,4152,2143,1993,1990,1991,1992,1994,1997,2001,1998,3181,3004,3005,3006,3024,3030,3032,3007,3219,3222,3223,3224,3225,3226,3415,3416,3417,3418,3386,3371,3598,3387,3606,3175,3176,1867,1859,3061,3062,4139,3039,3040,4128,3615,3617,4126,4129,4130,3008,3010,3012,3016,3011,3019,3607,3608,3610,3600,3605,3064,4140,4141,4142,4143,3063,1972,694,1694,1687,1688,703,704,1191,1203,1693,1673,1691,1172,1202,2319,2317,2320,1699,1697,1700,2448,2451,2452,2453,2455,1454,2446,518,520,1449,1450,3374,3380,3589,3590] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [377,199,201,386,387,388,403,405,412,413,590,591,624,414,575,592,594,887,574,588,623,208,209,212,203,204,207,217,219,240,215,875,877] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [1973,3070,3072,1971,1972,1974,2724,1963,2699,2701,1975,1978,3059,3096,1920,1848,1883,1921,1922,1919] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [1976,1977,1980,2693,1984,2690,2691,2692,4143,2001,2002,2003,2006,1990,1997,1986] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        