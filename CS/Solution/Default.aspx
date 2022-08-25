﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Solution.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> How to bind ASPxGridView with autogenerated columns to different data sources at runtime. The grid is created at design mode.</title>
</head>
<body>
	<form id="form1" runat="server">
		<table>
			<tr>
				<td valign="top">
					<dx:ASPxGridView ID="grid" runat="server" ClientInstanceName="grid" OnCustomCallback="grid_CustomCallback"
						OnDataBinding="grid_DataBinding" EnableViewState="false">
					</dx:ASPxGridView>
				</td>
				<td valign="top">
					<dx:ASPxRadioButtonList ID="rblDatasources" runat="server">
						<ClientSideEvents SelectedIndexChanged="function(s, e) { grid.PerformCallback(s.GetSelectedIndex()); }" />
						<Items>
							<dx:ListEditItem Selected="True" Text="Products" />
							<dx:ListEditItem Text="Categories" />
							<dx:ListEditItem Text="Shippers" />
						</Items>
					</dx:ASPxRadioButtonList>
				</td>
			</tr>
		</table>
        <asp:AccessDataSource ID="dsProducts" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [ProductID], [ProductName], [QuantityPerUnit], [UnitPrice] FROM [Products]"></asp:AccessDataSource>
        <asp:AccessDataSource ID="dsCategories" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]"></asp:AccessDataSource>
		<asp:AccessDataSource ID="dsShippers" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [ShipperID], [CompanyName], [Phone] FROM [Shippers]"></asp:AccessDataSource>
	</form>
</body>
</html>
