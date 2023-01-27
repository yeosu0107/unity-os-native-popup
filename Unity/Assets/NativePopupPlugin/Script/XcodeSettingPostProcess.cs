#if UNITY_EDITOR && UNITY_IOS
using System;
using System.IO;
using UnityEditor;
using UnityEditor.Callbacks;
using UnityEditor.iOS.Xcode;
using UnityEditor.iOS.Xcode.Extensions;
using UnityEngine;

public class XcodeSettingPostProcess
{
    private const string frameWorkPath = "NativePopupPlugin/Plugins/iOS";
    private const string frameworkName = "IOSNativePlugin.framework";
    
    [PostProcessBuildAttribute(33)]
    public static void OnPostprocessBuild(BuildTarget target, string pathToBuiltProject)
    {
        return; 
        // 빌드 대상이 ios인지 확인
        if (target != BuildTarget.iOS)
        {
            return;
        }
        
        Debug.Log("PBXProject setting initialize start");

        try
        {
            // PBXProject initialize
            var projectPath = pathToBuiltProject + "/Unity-iPhone.xcodeproj/project.pbxproj" ;
            PBXProject pbxProject = new PBXProject();
            pbxProject.ReadFromFile(projectPath);
            string targetGuid = pbxProject.GetUnityMainTargetGuid();
        
            // add IOSNativePlugin.framework
            string framework = Path.Combine(frameWorkPath, frameworkName);
            string frameworkGuid = pbxProject.AddFile(framework, "Frameworks/" + framework, PBXSourceTree.Sdk);
            PBXProjectExtensions.AddFileToEmbedFrameworks(pbxProject, targetGuid, frameworkGuid);
            pbxProject.SetBuildProperty(targetGuid, "LD_RUNPATH_SEARCH_PATHS", "$(inherited) @executable_path/Frameworks");
            
            // save PBXProject
            File.WriteAllText(projectPath, pbxProject.WriteToString());
        }
        catch (Exception e)
        {
            Debug.LogError("fail to initialize PBXProject");
            Debug.LogError(e.ToString());
            return;
        }
        
        Debug.Log("PBXProject initialize success");
    }
}
#endif