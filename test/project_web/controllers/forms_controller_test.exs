defmodule ProjectWeb.FormsControllerTest do
  use ProjectWeb.ConnCase

  import Project.PersonFixtures

  @create_attrs %{name: "some name", email: "some email", age: 42}
  @update_attrs %{name: "some updated name", email: "some updated email", age: 43}
  @invalid_attrs %{name: nil, email: nil, age: nil}

  describe "index" do
    test "lists all form", %{conn: conn} do
      conn = get(conn, ~p"/form")
      assert html_response(conn, 200) =~ "Listing Form"
    end
  end

  describe "new forms" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/form/new")
      assert html_response(conn, 200) =~ "New Forms"
    end
  end

  describe "create forms" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/form", forms: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/form/#{id}"

      conn = get(conn, ~p"/form/#{id}")
      assert html_response(conn, 200) =~ "Forms #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/form", forms: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Forms"
    end
  end

  describe "edit forms" do
    setup [:create_forms]

    test "renders form for editing chosen forms", %{conn: conn, forms: forms} do
      conn = get(conn, ~p"/form/#{forms}/edit")
      assert html_response(conn, 200) =~ "Edit Forms"
    end
  end

  describe "update forms" do
    setup [:create_forms]

    test "redirects when data is valid", %{conn: conn, forms: forms} do
      conn = put(conn, ~p"/form/#{forms}", forms: @update_attrs)
      assert redirected_to(conn) == ~p"/form/#{forms}"

      conn = get(conn, ~p"/form/#{forms}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, forms: forms} do
      conn = put(conn, ~p"/form/#{forms}", forms: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Forms"
    end
  end

  describe "delete forms" do
    setup [:create_forms]

    test "deletes chosen forms", %{conn: conn, forms: forms} do
      conn = delete(conn, ~p"/form/#{forms}")
      assert redirected_to(conn) == ~p"/form"

      assert_error_sent 404, fn ->
        get(conn, ~p"/form/#{forms}")
      end
    end
  end

  defp create_forms(_) do
    forms = forms_fixture()
    %{forms: forms}
  end
end
