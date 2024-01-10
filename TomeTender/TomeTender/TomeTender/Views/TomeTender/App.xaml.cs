﻿using System;
using TomeTender.Services;
using TomeTender.Views;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TomeTender
{
    public partial class App : Application
    {

        public App()
        {
            InitializeComponent();

            DependencyService.Register<MockDataStore>();
            //MainPage = new AppShell();

            MainPage = new NavigationPage(new LoginUI());
        }

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
