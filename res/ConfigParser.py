#! /usr/bin/env python

#
# Gmail Attachment Archiver
# Song Qiang <keeyang@ustc.edu>, 2013
#

class ConfigParser:
    """
    An alternative configure file parsor for python
    """
    def read(self, fn):
        """
        read configuration file
        """
        self.noSectionItems = {}
        self.sectionIterms = {}

        section = ""
        
        for line in open(fn):
            line = line.strip()
            comment_start = line.find("#")
            if comment_start != -1:
                line = line[:comment_start]

            leftsquare = line.find("[")
            rightsquare = line.find("]")
            if leftsquare != -1 and rightsquare != -1 and rightsquare > leftsquare:
                line = line[leftsquare:(rightsquare + 1)].strip()
                if line and not line in sectionIterms:
                    section = line
                    self.sectionIterms.update([(section, {})])
            else:
                fields = []
                if line.find("=") != -1:
                    fields = line.split("=", 1)
                elif line.find(":") != -1:
                    fields = line.split(":", 1)
                elif line.find("\t") != -1:
                    fields = line.split("\t", 1)
                elif line.find(" ") != -1:
                    fields = line.split(" ", 1)
                    
                if len(fields) == 2:
                    fields = [i.strip() for i in fields]
                    if fields[0] and fields[1]:
                        if section:
                            self.sectionIterms[section].update(\
                                        [(fields[0], fields[1])])
                        else:
                            self.noSectionItems.update([(fields[0], fields[1])])
    
    def __init__(self, fn):
		"""
		initialize parser with file fn
		"""
        self.read(fn)

    def items(self, section = ""):
 		"""
		return a list of key value pairs in given section. if no section is given,
		return the key value pairs not in any of named sections
		"""
        if section and section in self.sectionIterms:
            return [(k, v) for k, v in self.sectionIterms[section]]
        else:
            return [(k, v) for k, v in self.noSectionItems]

    def options(self, section = ""):
  		"""
		return a list of options in given section. if no section is given,
		return the options not in any of named sections
		"""
       if section and section in self.sectionIterms:
            return self.sectionIterms[section].keys()
        else:
            return self.noSectionItems.keys()

    def sections(self):
   		"""
		return a list of section names
		"""
       return [""] + self.sectionIterms.keys()


    def get(self, section = "", option = ""):
   		"""
		return the value of given option in the given section
		"""
       if section and section in self.sectionIterms:
            return self.sectionIterms[section][option]
        else:
            return self.noSectionIterms[option]
            
