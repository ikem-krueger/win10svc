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

        bool getStartType()
        {
            return true;
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
            string extractPath = tempPath + "win10srv\";
            
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
                
                // TODO: how much service start types exist?
                if startType == "0": // Automatic
                    Console.Write("Start service {0}... ", serviceName);
                    
                    service.Start();
                    
                    if service.Status == ServiceControllerStatus.Running:
                        Console.WriteLine("Success.");
                    else:
                        Console.WriteLine("Fail!");
                else if startType == "1": // Manual
                    Console.WriteLine("Skip service {0}...", serviceName);
            }
        }
    }
}
