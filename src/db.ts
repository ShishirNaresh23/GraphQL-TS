import pgPromise from 'pg-promise';
const connStr = 'postgresql://postgres@localhost:5432/postgres'; // add your psql details

const pgp = pgPromise({}); // empty pgPromise instance
export const psql = pgp(connStr); // get connection to your db instance
export const getCustomers = () => {
  const data =  psql.query('SELECT * FROM customers');
  return data;
}

export const getCustomer = async (customer_id: number) => {
  const data = await psql.query(`SELECT * FROM customers WHERE customer_id = ${customer_id}`);
  return data[0];
}
