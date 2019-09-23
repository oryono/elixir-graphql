defmodule Getaways.SubjectsTest do
  use Getaways.DataCase

  alias Getaways.Subjects

  describe "subjects" do
    alias Getaways.Subjects.Subject

    @valid_attrs %{description: "some description", title: "some title"}
    @update_attrs %{description: "some updated description", title: "some updated title"}
    @invalid_attrs %{description: nil, title: nil}

    def subject_fixture(attrs \\ %{}) do
      {:ok, subject} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Subjects.create_subject()

      subject
    end

    test "list_subjects/0 returns all subjects" do
      subject = subject_fixture()
      assert Subjects.list_subjects() == [subject]
    end

    test "get_subject!/1 returns the subject with given id" do
      subject = subject_fixture()
      assert Subjects.get_subject!(subject.id) == subject
    end

    test "create_subject/1 with valid data creates a subject" do
      assert {:ok, %Subject{} = subject} = Subjects.create_subject(@valid_attrs)
      assert subject.description == "some description"
      assert subject.title == "some title"
    end

    test "create_subject/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Subjects.create_subject(@invalid_attrs)
    end

    test "update_subject/2 with valid data updates the subject" do
      subject = subject_fixture()
      assert {:ok, %Subject{} = subject} = Subjects.update_subject(subject, @update_attrs)
      assert subject.description == "some updated description"
      assert subject.title == "some updated title"
    end

    test "update_subject/2 with invalid data returns error changeset" do
      subject = subject_fixture()
      assert {:error, %Ecto.Changeset{}} = Subjects.update_subject(subject, @invalid_attrs)
      assert subject == Subjects.get_subject!(subject.id)
    end

    test "delete_subject/1 deletes the subject" do
      subject = subject_fixture()
      assert {:ok, %Subject{}} = Subjects.delete_subject(subject)
      assert_raise Ecto.NoResultsError, fn -> Subjects.get_subject!(subject.id) end
    end

    test "change_subject/1 returns a subject changeset" do
      subject = subject_fixture()
      assert %Ecto.Changeset{} = Subjects.change_subject(subject)
    end
  end
end
