
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
        
        load "data/3rp8A.pdb", protein
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
 
        load "data/3rp8A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2231,2007,2183,2195,2200,2230,2229,2854,2855,2856,2152,2153,2154,2180,2151,2179,1985,1135,1319,2196,2197,2198,2199,2201,2202,280,281,282,283,284,2218,2219,2220,2204,2210,2211,2212,2213,2215,2217,2833,2831,2862,2828,2829,2832,2864,2825,2826,2827,1317,2003,1339,1341,1984,1318,1983,1608,1628,1629,1630,1631,1463,1546,1448,1449,478,2809,2835,2806,2546,2545,2206,2208,2612,2580,2581,2582,1517,1516,493,494,2699,2702,2742,2808,2810,2804,2770,2795,2799,1301,1303,1650,2800,2733,65,69,72,725,726,2234,2232,2233,2235,62,63,2147,61,73,1116,2253,759,1127,209,210,221,1120,1126,1121,1119,1122,215,250,260,1606,1607,253,256,258,259,242,263,264,1545,1340,211] 
set surface_color,  pcol1, surf_pocket1 
   
        
        deselect
        
        orient
        