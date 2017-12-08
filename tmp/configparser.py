#!/usr/bin/env python

#
# Gmail Attachment Archiver
# Song Qiang <keeyang@ustc.edu>, 2013
#

from io import open

class ConfigParser:
    """
    An alternative configure file parser for python
    """
    def read(self, filename, encoding=None):
        """
        read configuration file
        """
        try:
            self.sectionItems = {}
            self.noSectionItems = {}

            section = ""
            
            for line in open(filename, encoding=encoding):
                line = line.strip()
                comment_start = line.find("#")
                if comment_start != -1:
                    line = line[:comment_start]

                leftsquare = line.find("[")
                rightsquare = line.find("]")
                if leftsquare != -1 and rightsquare != -1 and leftsquare < rightsquare:
                    line = line[leftsquare:(rightsquare + 1)].strip()
                    if line and not line in self.sectionItems:
                        section = line.lstrip("[").rstrip("]")
                        self.sectionItems.update([(section, {})])
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
                        fields = [i.strip().lower() for i in fields]
                        if fields[0] and fields[1]:
                            if section:
                                self.sectionItems[section].update(\
                                            [(fields[0], fields[1])])
                            else:
                                self.noSectionItems.update([(fields[0], fields[1])])

            return [filename]
        except FileNotFoundError:
            return []

    '''
    def items(self, section=""):
        """
        return a list of key value pairs in given section. if no section is given,
        return the key value pairs not in any of named sections
        """
        if section and section in self.sectionItems:
            return [(k, v) for k, v in self.sectionItems[section]]
        else:
            return [(k, v) for k, v in self.noSectionItems]
    '''
    def items(self):
        raise NotImplementedError

    def options(self, section=""):
        """
        return a list of options in given section. if no section is given,
        return the options not in any of named sections
        """
        if section and section in self.sectionItems:
            return list(self.sectionItems[section].keys())
        else:
            return list(self.noSectionItems.keys())

    def sections(self):
        """
        return a list of section names
        """
        return list(self.sectionItems.keys())

    def get(self, section="", option=""):
        """
        return the value of given option in the given section
        """
        if section and section in self.sectionItems:
            return self.sectionItems[section][option]
        else:
            return self.noSectionItems[option]

