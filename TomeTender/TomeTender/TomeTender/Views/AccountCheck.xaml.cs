using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;


namespace TomeTender.Views
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class AccountCheck : ContentPage
	{
		public AccountCheck ()
		{
			InitializeComponent ();
		}
        async void GoToLogin(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new LoginPage());
        }
    }
}