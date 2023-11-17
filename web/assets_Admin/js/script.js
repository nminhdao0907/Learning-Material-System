
const convertToString = (data = []) => {
    let store = ``;
    for (let i = 0; i < data.length; i++) {
        if (i === data.length - 1) {
            store += data[i];
        } else {
            store += data[i] + ",";
        }
    }
    return store;
}

if (!sessionStorage.getItem("storeData")) {
    sessionStorage.setItem("storeData", JSON.stringify([]));
}
function saveSessionStorageDataToInputField() {
    document.querySelector('#storeAnswer').value = convertToString(storeData);
}

const storeData = (JSON.parse(sessionStorage.getItem("storeData")) === "" ? [] : JSON.parse(sessionStorage.getItem("storeData")));

saveSessionStorageDataToInputField();



document.addEventListener("DOMContentLoaded", function () {
    var quizOptions = document.querySelectorAll(".quiz-option");

    // Khởi tạo mảng để lưu trữ thông tin các đáp án đã chọn
    var selectedAnswers = [];
    for (var i = 0; i < quizOptions.length; i++) {
        quizOptions[i].addEventListener("change", function () {
            var checkboxValue = this.value;
            // Kiểm tra xem đáp án đã được chọn hay không
            if (this.checked) {
                if (!selectedAnswers.includes(checkboxValue)) {
                    selectedAnswers.push(checkboxValue);
                    storeData.push(checkboxValue);
                    sessionStorage.setItem("userChoice_" + checkboxValue, "checked");
                }
            } else {
                // delete a item on selectedAnswers if same value
                const selectedIndex = selectedAnswers.findIndex(e => e === checkboxValue);
                selectedAnswers.splice(selectedIndex, 1);

                const index = storeData.findIndex(e => e === checkboxValue);
                storeData.splice(index, 1);
                sessionStorage.removeItem("userChoice_" + checkboxValue);
            }

            sessionStorage.setItem("selectedAnswers", JSON.stringify(selectedAnswers));
            sessionStorage.setItem("storeData", JSON.stringify(storeData));
            saveSessionStorageDataToInputField();
        });

        var checkboxValue = quizOptions[i].value;
        var storedChoice = sessionStorage.getItem("userChoice_" + checkboxValue);
        if (storedChoice === "checked") {
            quizOptions[i].checked = true;
            // Nếu đáp án đã được chọn, thêm nó vào mảng selectedAnswers
            selectedAnswers.push(checkboxValue);
        }
    }
});



function clearSession() {
    sessionStorage.removeItem('selectedAnswers');
    sessionStorage.removeItem('storeData');
    sessionStorage.removeItem('timer');

    for (let key in sessionStorage) {
        if (key.includes("userChoice")) {
            sessionStorage.removeItem(key);
        }
    }
}