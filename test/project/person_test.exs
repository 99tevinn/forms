defmodule Project.PersonTest do
  use Project.DataCase

  alias Project.Person

  describe "form" do
    alias Project.Person.Forms

    import Project.PersonFixtures

    @invalid_attrs %{name: nil, email: nil, age: nil}

    test "list_form/0 returns all form" do
      forms = forms_fixture()
      assert Person.list_form() == [forms]
    end

    test "get_forms!/1 returns the forms with given id" do
      forms = forms_fixture()
      assert Person.get_forms!(forms.id) == forms
    end

    test "create_forms/1 with valid data creates a forms" do
      valid_attrs = %{name: "some name", email: "some email", age: 42}

      assert {:ok, %Forms{} = forms} = Person.create_forms(valid_attrs)
      assert forms.name == "some name"
      assert forms.email == "some email"
      assert forms.age == 42
    end

    test "create_forms/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Person.create_forms(@invalid_attrs)
    end

    test "update_forms/2 with valid data updates the forms" do
      forms = forms_fixture()
      update_attrs = %{name: "some updated name", email: "some updated email", age: 43}

      assert {:ok, %Forms{} = forms} = Person.update_forms(forms, update_attrs)
      assert forms.name == "some updated name"
      assert forms.email == "some updated email"
      assert forms.age == 43
    end

    test "update_forms/2 with invalid data returns error changeset" do
      forms = forms_fixture()
      assert {:error, %Ecto.Changeset{}} = Person.update_forms(forms, @invalid_attrs)
      assert forms == Person.get_forms!(forms.id)
    end

    test "delete_forms/1 deletes the forms" do
      forms = forms_fixture()
      assert {:ok, %Forms{}} = Person.delete_forms(forms)
      assert_raise Ecto.NoResultsError, fn -> Person.get_forms!(forms.id) end
    end

    test "change_forms/1 returns a forms changeset" do
      forms = forms_fixture()
      assert %Ecto.Changeset{} = Person.change_forms(forms)
    end
  end
end
