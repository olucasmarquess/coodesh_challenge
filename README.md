# Open Food Scraping
This is a Ruby on Rails web scraping project for collecting product information from the Open Food Facts website.

## Setup
Make sure you have Ruby on Rails installed on your system. Additionally, ensure that you have MongoDB configured and Mongoid installed for storing the collected data.

### Installing dependencies
Run the following command to install the project dependencies:

Inside folder Run to build the project

```bash
docker compose build
```

### Database configuration
Make sure you have correctly configured the database information in the `config/mongoid.yml` file.

Build the application
```bash
docker compose up --build
```

The project will be accessible at `http://localhost:3005`.

## Usage
Start the application
```bash
docker compose up
```
Stop the application
```bash
docker compose down
```


### Manual synchronization

To manually synchronize the products, you can either access the `/products/sync` route in your browser or run the following command:

```bash
rails products:sync
```

### Product listing

You can view the list of saved products by accessing the `/products` route in your browser.

### Product details

To view the details of a specific product, access the `/products/:code` route, where `:code` is the product code.

## Testing

To run the automated tests, use the following command:

```bash
bundle exec rspec
```

>  This is a challenge by [Coodesh](https://coodesh.com/)
