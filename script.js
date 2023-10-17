// Student array
var students = [];

// Course array
var courses = [];

// Add Student
function addStudent() {
    var firstName = $('#firstName').val();
    var lastName = $('#lastName').val();
    var age = $('#age').val();
    var courseId = $('#courseId').val();

    var student = {
        FirstName: firstName,
        LastName: lastName,
        Age: age,
        CourseID: courseId
    };

    students.push(student);

    // Clear form
    $('#studentForm')[0].reset();

    // Update Student List
    updateStudentList();
}

// Add Course
function addCourse() {
    var courseName = $('#courseName').val();

    var course = {
        CourseName: courseName
    };

    courses.push(course);

    // Clear form
    $('#courseForm')[0].reset();

    // Update Course List
    updateCourseList();
}

// Update Student List
function updateStudentList() {
    $('#studentList').empty();
    students.forEach(function (student, index) {
        $('#studentList').append('<li>' + student.FirstName + ' ' + student.LastName + ', Age: ' + student.Age + ', CourseID: ' + student.CourseID + '</li>');
    });
}

// Update Course List
function updateCourseList() {
    $('#courseList').empty();
    courses.forEach(function (course, index) {
        $('#courseList').append('<li>' + course.CourseName + '</li>');
    });
}
