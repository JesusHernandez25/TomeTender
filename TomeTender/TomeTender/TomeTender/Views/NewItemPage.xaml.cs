using System;
using System.Collections.Generic;
using System.ComponentModel;
using TomeTender.Models;
using TomeTender.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TomeTender.Views
{
    public partial class NewItemPage : ContentPage
    {
        public Item Item { get; set; }

        public NewItemPage()
        {
            InitializeComponent();
            BindingContext = new NewItemViewModel();
        }
    }
}