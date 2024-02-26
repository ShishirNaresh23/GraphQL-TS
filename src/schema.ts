export const typeDefs = `#graphql
# Comments in GraphQL strings (such as this one) start with the hash (#) symbol.

type Customer {
  customer_id: Int!
  customer_name: String!
}

type Query {
  customers: [Customer]
  customer(customer_id: Int!): Customer
}
`;
