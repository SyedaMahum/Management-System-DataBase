const express = require('express');
const mysql = require('mysql');
const path = require('path');
const bodyParser = require('body-parser');

const app = express();

const connection = mysql.createConnection({
    host: 'localhost',
    database: 'management',
    user: 'root',
    password: 'mahum1234',
});

app.listen(3000, function () {
    console.log('App listening on port 3000');
    connection.connect(function (err) {
        if (err) {
            throw err;
        }
        console.log('Connected!');
    });
});

app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.use(bodyParser.urlencoded({ extended: true }));

app.post('/addStudent', (req, res) => {
    let studentName = req.body.studentName;
    let studentEmail = req.body.studentEmail;
    let studentUsername = req.body.studentUsername;
    let studentPassword = req.body.studentPassword;
    let dietaryPreferences = req.body.dietaryPreferences;
    let familyMembers = req.body.familyMembers;

    let name = req.body.menuName;
    let itemName = req.body.itemName;
    let itemPrice = req.body.itemPrice;
    let votes = req.body.votes;

    let purchased = req.body.purchased;
    let price = req.body.price;
    let purchaseDate = req.body.purchaseDate;

    let studentSql = `INSERT INTO student (name, email, username, password, dietary_preferences, family_members)
        VALUES ('${studentName}', '${studentEmail}', '${studentUsername}', '${studentPassword}', '${dietaryPreferences}', '${familyMembers}')`;

    connection.query(studentSql, (err, studentResult) => {
        if (err) {
            console.error('Error inserting student data:', err);
            res.status(500).send('Internal Server Error - Student Data Insertion');
            return;
        }
        console.log('Student data inserted successfully');

        let ticketSql = `INSERT INTO ticket (status, price, purchase_data)
            VALUES ('${purchased}', '${price}', '${purchaseDate}')`;

        connection.query(ticketSql, (err, ticketResult) => {
            if (err) {
                console.error('Error inserting ticket data:', err);
                res.status(500).send('Internal Server Error - Ticket Data Insertion');
                return;
            }

            let itemSql = `INSERT INTO menu_items (name, itemname, price, votes)
            VALUES ('${name}', '${itemName}', '${itemPrice}', '${votes}')`;
    
            connection.query(itemSql, (err, itemResult) => {
                if (err) {
                    console.error('Error inserting menu item data:', err);
                    res.status(500).send('Internal Server Error - Menu Item Data Insertion');
                    return;
                }
                console.log('Menu item data inserted successfully');
                res.send('Menu Item data inserted successfully');
            });
                console.log('Ticket data inserted successfully');
                res.send('Student, Ticket, and Menu Item data inserted successfully');
                
            });
        });
      
    });


app.post('/addTeacher', (req, res) => {
    let teacherName = req.body.teacherName;
    let teacherEmail = req.body.teacherEmail;
    let teacherFamilyMembers = req.body.teacherFamilyMembers;
    let purchased = req.body.purchased;
    let price = req.body.price;
    let purchaseDate = req.body.purchaseDate;

    let teacherSql = `INSERT INTO teachers (name, email, family_members)
        VALUES ('${teacherName}', '${teacherEmail}', '${teacherFamilyMembers}')`;

    connection.query(teacherSql, (err, result) => {
        if (err) {
            console.error('Error inserting data into teachers table:', err);
            res.status(500).send('Internal Server Error');
        } else {
            console.log('Teacher added successfully');

            let ticketSql = `INSERT INTO ticket (status, price, purchase_data)
                VALUES ('${purchased}', '${price}', '${purchaseDate}')`;

            connection.query(ticketSql, (err, result) => {
                if (err) {
                    console.error('Error inserting ticket data:', err);
                    res.status(500).send('Internal Server Error');
                } else {
                    console.log('Ticket inserted successfully');
                  
                   res.status(200).send('Teacher and Ticket added successfully');
                    
                    
                }
            });
        }
    });
    
});


// Assuming you've already created a connection to the database

app.post('/dinnerRegistration', (req, res) => {
    let itemName = req.body.itemname;
    let type = req.body.type;

    let decorationSql = `INSERT INTO decoration (itemname, type)
        VALUES ('${itemName}', '${type}')`;

    connection.query(decorationSql, [itemName, type], (err, result) => {
        if (err) {
            console.error('Error inserting data into decoration table:', err);
            res.status(500).send('Internal Server Error');
        } else {
            console.log('Decoration added successfully');

            // You may perform additional operations if needed

            res.status(200).send('Decoration added successfully');
        }
    });
});

app.post('/submitPerformanceData', (req, res) => {
    let performanceType = req.body.performanceType;
    let duration = req.body.duration;
    let specialRequirements = req.body.specialRequirements;
    let votes = req.body.votes || 0;  // Default value if votes are not provided

    let performanceSql = `INSERT INTO performance (performance_type, duration, special_requirements, votes)
        VALUES ('${performanceType}', '${duration}', '${specialRequirements}', '${votes}')`;

    connection.query(performanceSql, (err, result) => {
        if (err) {
            console.error('Error inserting data into performance table:', err);
            res.status(500).send('Internal Server Error');
        } else {
            console.log('Performance data added successfully');

            // You may perform additional operations if needed

            res.status(200).send('Performance data added successfully');
        }
    });
});
