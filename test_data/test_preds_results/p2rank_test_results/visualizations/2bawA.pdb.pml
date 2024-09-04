
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
        
        load "data/2bawA.pdb", protein
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
 
        load "data/2bawA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [517,520,521,497,498,499,501,519,522,500,918,919,1025,1118,872,874,923,1951,541,542,487,488,489,457,459,1024,977,979,978,330,403,932,933,929,935,406,552,823,802,528,529,551,833,845,850,854,855,856,1140,843,844,846,1949,135,578,847,148,946,151,152,875,155,924,866,867,102,940,941,948,144,157,163,469,506,507,508,1918,467,1108,1110,1081,1115,1117,1915,460,1792,1793,1820,1822,1981,1983,1112,1105,1106,1142,1143,1948,1953,1978,1819,1858,1917,1856] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [1739,1773,1736,1982,1980,1764,1765,1766,1798,776,778,1998,1383,1384,1972,1975,1969,797,793,772,773,811,799,764,771,774] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [41,44,45,12,13,1560,39,1558,37,74,76,1265,1266,1590,71] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        