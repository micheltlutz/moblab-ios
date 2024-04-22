//
//  SceneDelegate.swift
//  MobLab
//
//  Created by Michel Anderson Lutz Teixeira on 12/04/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var appManager: AppManager?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            print("Enter in willConnectTo")
            appManager = AppManager(window: window)
            appManager?.start()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        print("Enter in openURLContexts")
        guard let url = URLContexts.first?.url else {
            return
        }

        // Verifica se o URL possui um esquema associado
        if let scheme = url.scheme {
            // Verifica se o esquema é o esperado
            if scheme == "moblab" {
                // Faça o que for necessário com o URL
                // Por exemplo, manipule o URL para navegar para uma determinada tela
                // ou extraia informações do URL para processamento adicional
                
                print("moblab > Scene Delegate: \(url)")
                appManager?.start(with: url)
            }
        }
    }
}
