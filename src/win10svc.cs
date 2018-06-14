using System;
using System.IO;
using System.IO.Compression;
using System.ServiceProcess;

namespace ConsoleApplication
{
    class RegistryFile
    {
        // TODO: we need a registry file reader
        RegistryFile(string file)
        {
            Filename = File.open(file);
        }
        
        string getDisplayName(string registryFile)
        {
            return "";
        }

        string getDescription()
        {
            return "";
        }

        string getStartType()
        {
            /* 
            http://daijia11.blogspot.com/2010/08/how-to-change-service-start-type-in.html
            
            0x0 Boot
            0x1 System
            0x2 Automatic
            0x3 Manual
            0x4 Disabled
            */
            
            return "";
        }

        bool importToRegistry()
        {
            return true;
        }
    }

    class Win10Svc()
    {
        static void Main(string[] args)
        {
            string zipFile = "services.zip";
            string tempPath = Path.GetTempPath();
            string extractPath = tempPath + @"win10srv\";
            
            Console.WriteLine("Extract {0}...", zipFile);
            ZipFile.ExtractToDirectory(zipFile, extractPath);
            
            string[] regFiles = DirectoryPath.GetFiles(extractPath, "*.reg");
            
            foreach(string regFile in regFiles)
            {
                RegistryFile reg = new RegistryFile(regFile);
                
                serviceName = reg.getDisplayName();
                
                ServiceController service = new ServiceController(serviceName);
                
                Console.Write("Stop service '{0}'... ", serviceName);
                
                service.Stop();
                
                if service.Status == ServiceControllerStatus.Stopped:
                    Console.WriteLine("Success.");
                else:
                    Console.WriteLine("Fail!");
                
                Console.Write("Reset service '{0}'... ", serviceName);
                
                bool result = reg.importToRegistry();
                
                if result == true:
                    Console.WriteLine("Success.");
                else:
                    Console.WriteLine("Fail!");
                
                string startType = reg.getStartType();
                
                if startType == "2": // Automatic
                    Console.Write("Start service {0}... ", serviceName);
                    
                    service.Start();
                    
                    if service.Status == ServiceControllerStatus.Running:
                        Console.WriteLine("Success.");
                    else:
                        Console.WriteLine("Fail!");
                else:
                    Console.WriteLine("Skip service {0}...", serviceName);
            }
        }
    }
}
