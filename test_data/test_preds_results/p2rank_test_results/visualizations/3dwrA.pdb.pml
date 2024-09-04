
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
        
        load "data/3dwrA.pdb", protein
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
 
        load "data/3dwrA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [734,736,756,757,758,759,862,476,582,583,586,591,595,597,2073,2075,492,494,510,511,512,571,312,499,552,553,555,556,557,342,297,294,707,708,709,719,720,722,613,737,738,1404,1411,1264,1252,1383,1381,1385,1344,886,885,1944,1968,1969,1970,1984,1985,1972,1976,1980,2008,2009,2015,2010,2053,2055,2057,2058,2059,2016,2019,2014,313,314,315,1950,1929,1934,1941,1942,1943,1945,1946,1974,1978,1982,2080,2081,1897,1927,1928,1936] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [486,98,99,502,504,62,63,64,353,285,340,289,306,283,344,345,484,351,341,343,346,335,336,337,338] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [398,400,2044,2074,453,450,451,452,382,380,384,256,254,258] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [2193,2216,2219,1743,2205,2208,2211,2250,2249,2182,1778,1781,1813,1815,1816,2184,1777,1741,1767,1775,1783] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        